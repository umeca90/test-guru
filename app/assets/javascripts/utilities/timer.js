document.addEventListener('turbolinks:load', function () {
  var timer = document.querySelector('.timer');

  if (timer) {
    var time = timer.dataset.timer;

    setInterval(function () {
      if (time > 0) {
          time -= 1;
      } else {
        alert('Whoops, you run out of time!');
        document.getElementById('passage').submit();
      }

      var minutes = parseInt(time / 60);
      var seconds = parseInt(time % 60);

      timer.innerHTML = minutes + ':' + seconds;
    }, 1000);
  }
});
