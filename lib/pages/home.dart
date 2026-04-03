import 'package:flutter/material.dart';
import 'package:forms/pages/confirmation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  final _nomeController = TextEditingController();
  final _idadeController = TextEditingController();
  final _emailController = TextEditingController();

  final _nomeFocus = FocusNode();
  final _idadeFocus = FocusNode();
  final _emailFocus = FocusNode();

  String? _generoSelecionado;

  bool _aceitouTermos = false;

  static const _inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
  );

  static const _labelStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      appBar: AppBar(
        title: const Text(
          'Cadastro de usuários',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //------------------------------------------------------------------------------
                TextFormField(
                  controller: _nomeController,
                  focusNode: _nomeFocus,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_idadeFocus);
                  },
                  style: const TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    labelStyle: _labelStyle,
                    hintText: 'Digite seu nome completo',
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 18,
                    ),
                    border: _inputBorder,
                    enabledBorder: _inputBorder,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 2,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe o nome';
                    } else if (value.length < 2) {
                      return 'O nome deve ter pelo menos 2 caracteres';
                    } else if (!RegExp(r'^[a-zA-ZÀ-ÿ\s]+$').hasMatch(value)) {
                      return 'Informe um nome válido (apenas letras e espaços)';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                //------------------------------------------------------------------------------
                TextFormField(
                  controller: _idadeController,
                  focusNode: _idadeFocus,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_emailFocus);
                  },
                  style: const TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    labelText: 'Idade',
                    labelStyle: _labelStyle,
                    hintText: 'Digite sua idade',
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 18,
                    ),
                    border: _inputBorder,
                    enabledBorder: _inputBorder,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 2,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe sua idade';
                    } else if (int.tryParse(value) == null) {
                      return 'Informe uma idade válida (apenas números)';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                //------------------------------------------------------------------------------
                TextFormField(
                  controller: _emailController,
                  focusNode: _emailFocus,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).unfocus();
                  },
                  style: const TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: _labelStyle,
                    hintText: 'exemplo@email.com',
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 18,
                    ),
                    border: _inputBorder,
                    enabledBorder: _inputBorder,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 2,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe seu email';
                    }
                    if (!value.contains('@')) {
                      return 'Insira um endereço de email válido';
                    }
                    if (!value.contains('.')) {
                      return 'Insira um endereço de email válido';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                //------------------------------------------------------------------------------
                DropdownButtonFormField<String>(
                  value: _generoSelecionado,
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                  decoration: InputDecoration(
                    labelText: 'Gênero',
                    labelStyle: _labelStyle,
                    hintText: 'Selecione seu gênero',
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 18,
                    ),
                    border: _inputBorder,
                    enabledBorder: _inputBorder,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 2,
                      ),
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: 'Masculino',
                      child: Text('Masculino'),
                    ),
                    DropdownMenuItem(
                      value: 'Feminino',
                      child: Text('Feminino'),
                    ),
                    DropdownMenuItem(value: 'Outro', child: Text('Outro')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _generoSelecionado = value;
                      });
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe seu gênero';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                //------------------------------------------------------------------------------
                FormField<bool>(
                  validator: (value) {
                    if (value != true) {
                      return 'Você deve aceitar os termos de serviço';
                    }
                    return null;
                  },
                  builder: (FormFieldState<bool> state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Colors.blueAccent,
                              value: _aceitouTermos,
                              onChanged: (value) {
                                setState(() {
                                  _aceitouTermos = value ?? false;
                                  state.didChange(value);
                                });
                              },
                            ),
                            const Expanded(
                              child: Text(
                                'Li e aceito os termos de uso e política de privacidade',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (state.hasError)
                          Padding(
                            padding: const EdgeInsets.only(left: 12, top: 4),
                            child: Text(
                              state.errorText!,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 32),

                //------------------------------------------------------------------------------
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      try {
                        final nomeRecebido = _nomeController.text;
                        final idadeRecebida = int.parse(_idadeController.text);
                        final emailRecebido = _emailController.text;
                        final generoRecebido = _generoSelecionado!;

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConfirmationPage(
                              nome: nomeRecebido,
                              idade: idadeRecebida,
                              email: emailRecebido,
                              genero: generoRecebido,
                              aceitouTermos: _aceitouTermos,
                            ),
                          ),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Erro ao processar os dados: $e'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Preencha todos os campos corretamente.',
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: const Text('Cadastrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
