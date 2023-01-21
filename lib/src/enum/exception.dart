enum MException {
  validateCredentials('Usuario o contraseña incorrectos.'),
  userCreated('No se pudo crear el usuario.'),
  emailAlreadyInUse('El correo ya se encuentra registrado.'),
  invalidEmail('El correo no es válido.'),
  operationNotAllowed('Operación no permitida.'),
  weakPassword('La contraseña es muy débil.'),
  userDisabled('Su usuario ha sido deshabilitado.'),
  userNotFound('Usuario o contraseña incorrectos.'),
  serverError('Error del servidor.'),
  tooManyRequests(
    'El acceso a esta cuenta se ha inhabilitado temporalmente debido a muchos intentos fallidos de inicio de sesión. Puede restaurarlo inmediatamente restableciendo su contraseña o puede volver a intentarlo más tarde.',
  ),
  wrongPassword('Usuario o contraseña incorrectos.');

  const MException(this.msg);

  final String msg;
}
