document.addEventListener('turbolinks:load', function() {
  var progress = document.querySelector('.progress');
  var progressBar = document.querySelector('.progress_bar');

  if (progress && progressBar) {
    var question = document.querySelector('form').dataset.currentQuestion;
    var questions_size = document.querySelector('form').dataset.questionsSize;

    progressBar.style.width = question / questions_size * 100 + '%';
    progressBar.innerHTML = question / questions_size * 100 + '%';
  }
});
