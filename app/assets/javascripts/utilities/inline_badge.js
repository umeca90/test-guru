document.addEventListener('turbolinks:load', function() {
  var controls = document.querySelectorAll('.badge-link');

  if(controls.length) {
    for (var i = 0; i < controls.length; i++) {
    controls[i].addEventListener('click', badgeInlineLinkHandler);
    }
  }

  var errors = document.querySelector('.resource-errors');
  var formInline = document.querySelector('.inline-badge');

  if (errors && formInline) {
    var resourceId = errors.dataset.resourceId;
    badgeInlineHandler(resourceId);
  }
});

function badgeInlineLinkHandler(event) {
  event.preventDefault();

  var badgeId = this.dataset.badgeId;
  badgeInlineHandler(badgeId);
}

function badgeInlineHandler(badgeId) {
  var link = document.querySelector('.badge-link[data-badge-id="' + badgeId + '"]');
  var testTitle = document.querySelector('.badge-name[data-badge-id="' + badgeId + '"]');
  var formInline = document.querySelector('.inline-badge[data-badge-id="' + badgeId + '"]');
//  var $testTitle = $('.test-title[data-test-id="' + testId + '"]');
//  var $formInline = $('.form-inline[data-test-id="' + testId + '"]');

//  $formInline.toggle();
//  $testTitle.toggle();

//  if ($formInline.is(':visible')) {
//    link.textContent = 'Cancel';
//  } else {
//    link.textContent = 'Edit';
//  }

  if (formInline.classList.contains('hide')) {
    testTitle.classList.add('hide');
    formInline.classList.remove('hide');
    link.textContent = 'Cancel';
  } else {
    testTitle.classList.remove('hide');
    formInline.classList.add('hide');
    link.textContent = 'Edit';
  }

}
