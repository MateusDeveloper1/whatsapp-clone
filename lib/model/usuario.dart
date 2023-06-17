class Usuario {
  late String? _nome;
  late String? _email;
  late String? _senha;

  Usuario();

  get nome => _nome;

  set nome(value) => _nome = value;

  get email => _email;

  set email(value) => _email = value;

  get senha => _senha;

  set senha(value) => _senha = value;
}
