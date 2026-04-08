import type { Metadata } from "next";
import "./globals.css";

const FAVICON = "https://lnzxjtzquxhxdlqqenjo.supabase.co/storage/v1/object/public/media/Fivecon%20(1).png";

export const metadata: Metadata = {
  title: "MAX — Grupo Venda",
  description: "Monitor Ativo de Operações",
  icons: {
    icon: FAVICON,
    shortcut: FAVICON,
    apple: FAVICON,
  },
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="pt-BR">
      <body>{children}</body>
    </html>
  );
}
