/**
 * @param {String} titulo Texto que se muestra con fuente ampliada
 * @param {String} mensaje Contenido detallando la notificación
 * @param {Int} tiempo Tiempo que dura el mensaje en pantalla en segundos
 * */
function notificar(titulo, mensaje, tiempo){
  Swal.fire({
    icon: 'info',
    title: titulo,
    text: mensaje,
    confirmButtonColor: '#2E86C1',
    confirmButtonText: 'Aceptar',
    footer: 'Coloque aquí el nombre de su aplicación',
    timerProgressBar: true,
    timer: (tiempo * 1000)
  })
}


/**
 * @param {String} titulo Texto que se muestra con fuente ampliada
 * @param {String} mensaje Contenido detallando la notificación
 * */
function mostrarPregunta(titulo, mensaje) {
  return Swal.fire({
      title: titulo,
      text: mensaje,
      icon: 'question',
      showCancelButton: true,
      confirmButtonText: 'Aceptar',
      cancelButtonText: 'Cancelar',
      confirmButtonColor: '#2E86C1',
      cancelButtonColor: '#797D7F',
      footer: 'Coloque aquí el nombre de su aplicación'
    }).then((result) => {
      return result;
  });
}

/**
 * @param {String} mensaje Texto que se muestra en el Toast
 * */
function toast(mensaje){
  const Toast = Swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 2000,
    timerProgressBar: true,
    didOpen: (toast) => {
      toast.addEventListener('mouseenter', Swal.stopTimer)
      toast.addEventListener('mouseleave', Swal.resumeTimer)
    }
  })

  Toast.fire({
    icon: 'success',
    title: mensaje
  })
}


