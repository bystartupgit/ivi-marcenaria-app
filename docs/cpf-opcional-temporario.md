# Modificação Temporária: Campo CPF Opcional na Criação de Cliente

## 📋 Informações Gerais

**Data da Modificação:** 2025-01-13  
**Status:** ⚠️ **TEMPORÁRIO**  
**Autorização:** Aprovado pela gestão da equipe de tecnologia

---

## 🎯 Objetivo

Tornar o campo CPF opcional no formulário de criação de novo cliente, permitindo que usuários possam criar clientes sem informar o CPF.

---

## ⚠️ Importante

**Esta é uma solução TEMPORÁRIA** implementada para contornar limitações do backend/banco de dados. A solução definitiva requer ajustes no backend para aceitar CPF como campo opcional.

---

## 📝 Descrição da Modificação

### O que foi alterado:

O campo CPF foi tornado opcional no processo de registro de clientes. Quando o usuário não preenche o CPF, o sistema envia automaticamente a sequência `00000000000` (11 zeros) para o banco de dados, permitindo que a validação do backend seja satisfeita.

### Por que essa solução:

- O backend/banco de dados atualmente exige que o campo CPF seja preenchido
- Ajustar o backend para aceitar CPF opcional requer alterações mais complexas
- Esta solução permite que o desenvolvimento continue enquanto o backend é ajustado

---

## 📂 Arquivos Modificados

### 1. RegisterDTO

**Caminho:** `lib/modules/login/domain/dto/register_dto.dart`

**Alterações realizadas:**

1. **Linha 18:** Campo CPF tornou-se opcional com valor padrão vazio

   ```dart
   this.cpf = "",
   ```

2. **Linhas 23-29:** Lógica no método `toMap()` para tratar CPF vazio

   ```dart
   toMap() {
     //Solução temporaria para o backend aceitar CPF opcional, acerta com a gestão.
     // Se CPF estiver vazio, envia sequência de zeros para o banco aceitar
     // TODO: Solução temporária - ajustar backend para aceitar CPF opcional
     String cpfValue = cpf.isEmpty
         ? "00000000000"
         : cpf.replaceAll(".", "").replaceAll("-", "");
   ```

3. **Linha 41:** CPF sempre é incluído no payload (com valor real ou zeros)
   ```dart
   RegisterParamsMapper.cpf: cpfValue,
   ```

---

## 🔄 Como Funciona

### Fluxo de Execução:

1. **Usuário preenche o CPF:**

   - CPF é formatado (remove pontos e traços)
   - Valor real é enviado ao backend

2. **Usuário NÃO preenche o CPF:**
   - Sistema detecta que `cpf.isEmpty == true`
   - Substitui por `"00000000000"` (11 zeros)
   - Valor de zeros é enviado ao backend

### Exemplo de Payload:

**Com CPF preenchido:**

```json
{
  "nome": "João Silva",
  "email": "joao@email.com",
  "senha": "senha123",
  "cpf": "12345678901",
  "telefone": "11999999999",
  "tipo_usuario": "cliente"
}
```

**Sem CPF (campo vazio):**

```json
{
  "nome": "João Silva",
  "email": "joao@email.com",
  "senha": "senha123",
  "cpf": "00000000000",
  "telefone": "11999999999",
  "tipo_usuario": "cliente"
}
```

---

## 🐛 Logs de Debug

O código inclui logs de debug para facilitar a identificação do comportamento:

- **CPF vazio:** `🔴 [RegisterDTO] CPF vazio - enviando 00000000000 para o banco`
- **CPF preenchido:** `📦 [RegisterDTO] CPF incluído no payload: [valor]`
- **Payload completo:** `📦 [RegisterDTO] Payload completo: [mapa]`

---

## ⚠️ Limitações e Riscos

### Problemas Conhecidos:

1. **Dados incorretos no banco:** Clientes sem CPF terão `00000000000` armazenado
2. **Dificulta identificação:** Não é possível distinguir facilmente quais clientes realmente não têm CPF
3. **Validações futuras:** Se o backend implementar validação de CPF, pode rejeitar os zeros
4. **Relatórios e buscas:** Pode impactar consultas que filtram por CPF

---

## ✅ Próximos Passos (Solução Definitiva)

Para implementar a solução definitiva, é necessário:

1. **Ajustar o backend:**

   - Tornar o campo CPF opcional na validação
   - Aceitar `null` ou string vazia no banco de dados
   - Atualizar a documentação da API

2. **Remover a solução temporária:**

   - Remover a lógica de substituição por zeros no `RegisterDTO`
   - Ajustar o `toMap()` para não enviar o campo quando vazio (ou enviar `null`)
   - Remover os comentários TODO

3. **Testes:**
   - Validar criação de cliente sem CPF
   - Validar criação de cliente com CPF
   - Verificar se não quebrou outras funcionalidades

---

## 📞 Contato

Em caso de dúvidas ou problemas relacionados a esta modificação, entre em contato com a equipe de tecnologia.

---

## 📌 Notas Adicionais

- Esta modificação afeta **todos os lugares** que usam `RegisterDTO` (criação de cliente, registro de usuário, etc.)
- A solução é **centralizada** em um único ponto, facilitando a manutenção
- Os logs de debug podem ser removidos após validação completa da funcionalidade

---

**Última atualização:** 2025-01-13
