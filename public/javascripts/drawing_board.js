function _c(e) { e.preventDefault(); e.stopPropagation() }

var Tip = (function() {
  return {
    create: function(pos) {
      $('<div/>').appendTo('body').admin_tip({ pos: pos })
    }
  }
})()

;(function($) {
  $.widget('ui.drawing_board', {
    options: {},
    _create: function() {
      var o = this.options, e = this.element, self = this
      // должен обрабатывать двойной клик
      e.dblclick(function(e) {
        _c(e)
        pos = [ e.pageX, e.pageY ]
        Tip.create(pos)
      })
    }
  })
})(jQuery);

;(function($) {
  $.widget('ui.admin_tip', {
    options: {
      pos: [0, 0],
      size: [400, 100],
      klass: 'tip',
      content: ''
    },
    _create: function() {
      var o = this.options, e = this.element, self = this,
      t = $('<textarea/>').val(o.content),
      s = $('<input type="button" value="Save"/>'),
      r = $('<input type="button" value="Remove"/>')

      e.css({ left: o['pos'][0], top: o['pos'][1] })
        .width(o['size'][0]).height(o['size'][1])
        .addClass(o['klass'])
        .draggable()
        .append($('<div/>').append(t).append(s).append(r))
      s.click(function(ev) {
        _c(ev)
        var position = e.position()
        $.create('/pages/' + PAGE_ID + '/tips.json', { tip: {
          point: { l: position.left, t: position.top },
          size: { w: e.width(), h: e.height() },
          body: t.val()
        }}, function() {
          t.replaceWith(t.val())
        })
      })
      r.click(function(ev) {
        
      })
      t.focus()
    }
  })
})(jQuery);