import Groq from "groq-sdk";
import type { FeedbackIA } from "./types";

function getClient() {
  const key = process.env.GROQ_API_KEY;
  if (!key) throw new Error("GROQ_API_KEY não configurado");
  return new Groq({ apiKey: key });
}

const SYSTEM_PROMPT =
  "Você é um avaliador de olimpíadas de matemática para estudantes do ensino fundamental (6º e 7º ano). Avalie com precisão mas de forma encorajadora. Considere raciocínio parcialmente correto.";

const INSTRUCOES_FORMATO = `Identifique os itens (a, b, c…) na solução oficial e avalie cada um na resposta do aluno.
Responda SOMENTE com JSON válido, sem markdown:
{"itens":[{"item":"a","status":"correto","comentario":"..."},{"item":"b","status":"parcial","comentario":"..."}],"resumo":"..."}

Valores de status: correto, parcial, incorreto, nao_respondido`;

function parseFeedback(raw: string): FeedbackIA {
  const match = raw.match(/\{[\s\S]*\}/);
  if (!match) throw new Error("Resposta inesperada da IA");
  return JSON.parse(match[0]) as FeedbackIA;
}

export async function avaliarRespostaAberta(
  enunciado: string,
  solucao: string,
  resposta: string,
): Promise<FeedbackIA> {
  const groq = getClient();

  const completion = await groq.chat.completions.create({
    model: "llama-3.3-70b-versatile",
    temperature: 0.1,
    max_tokens: 800,
    messages: [
      { role: "system", content: SYSTEM_PROMPT },
      {
        role: "user",
        content: `Avalie a resposta do aluno para esta questão da OBMEP.

ENUNCIADO:
${enunciado}

SOLUÇÃO OFICIAL:
${solucao}

RESPOSTA DO ALUNO:
${resposta}

${INSTRUCOES_FORMATO}`,
      },
    ],
  });

  return parseFeedback(completion.choices[0]?.message?.content ?? "{}");
}

// Avalia quando a solução oficial está disponível apenas como imagem (sem texto extraído).
export async function avaliarRespostaAbertaComImagem(
  enunciado: string,
  imagemSolucaoUrl: string,
  resposta: string,
): Promise<FeedbackIA> {
  const groq = getClient();

  const completion = await groq.chat.completions.create({
    model: "meta-llama/llama-4-scout-17b-16e-instruct",
    temperature: 0.1,
    max_tokens: 800,
    messages: [
      { role: "system", content: SYSTEM_PROMPT },
      {
        role: "user",
        content: [
          {
            type: "text",
            text: `Avalie a resposta do aluno para esta questão da OBMEP.

ENUNCIADO:
${enunciado}

RESPOSTA DO ALUNO:
${resposta}

A imagem anexada contém a solução oficial.

${INSTRUCOES_FORMATO}`,
          },
          { type: "image_url", image_url: { url: imagemSolucaoUrl } },
        ],
      },
    ],
  });

  return parseFeedback(completion.choices[0]?.message?.content ?? "{}");
}
