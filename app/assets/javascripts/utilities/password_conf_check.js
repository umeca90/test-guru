document.addEventListener('turbolinks:load', function() {
  var password = document.querySelector('.pass');
  var confirmation = document.querySelector('.pass_conf');

  if (password && confirmation) {
    password.addEventListener('input', passwordsCompare.bind(null ,password, confirmation));
    confirmation.addEventListener('input', passwordsCompare.bind(null, password, confirmation));
  }
})

function passwordsCompare(password, confirmation) {
  if (password.value == confirmation.value && (password.value != "")) {
    document.querySelector('.octicon-check').classList.remove('hide');
    document.querySelector('.octicon-alert').classList.add('hide');
  } else if (confirmation.value == '') {
    document.querySelector('.octicon-check').classList.add('hide');
    document.querySelector('.octicon-alert').classList.add('hide');
  } else {
    document.querySelector('.octicon-check').classList.add('hide');
    document.querySelector('.octicon-alert').classList.remove('hide');
   }
}

