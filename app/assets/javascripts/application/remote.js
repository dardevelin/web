function add_remote(){
  $("#sidebar nav li#home a").attr('data-remote', true);
  $("#sidebar nav li#services a").attr('data-remote', true);
  $("#sidebar nav li#work a").attr('data-remote', true);
  $("#sidebar nav li#about a").attr('data-remote', true);
  $("#sidebar nav li#contact a").attr('data-remote', true);
}

$(function(){
  add_remote();
  History.Adapter.bind(window,'statechange',function(){
    var State = History.getState();
    $.get(State.url, function(){}, 'script')
  });
  $('a[data-remote="true"]').live('click', function(){
    History.pushState(null, null, $(this).attr('href'));
    return false;
  });
});
