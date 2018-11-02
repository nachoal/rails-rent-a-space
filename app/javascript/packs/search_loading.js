document.body.addEventListener('ajax:send', (event) => {
  document.getElementById('card-results').innerHTML = '<i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i><span class="sr-only">Loading...</span>';
});
