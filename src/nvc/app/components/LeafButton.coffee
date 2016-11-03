{defineModule, FluxComponent, Element, TextElement, FillElement, RectangleElement, log} = require 'art-suite'
{StyleProps} = Neptune.Nvc.App.Styles
{PointerActionsMixin} = require 'art-react/mixins'
Button = require './Button'

defineModule module, ->

  class LeafButton extends PointerActionsMixin FluxComponent
    @subscriptions selected: getSelectedKey = ({name, path}) ->

      if path[0] != "selected"
        out = path.join ' > '
        out += " > #{name}" if name
        out
      else name

    action: ->
      selected = @models.selected.toggle getSelectedKey @props

    render: ->
      {name, parentName, text, selectedText} = @props

      if name?.match /\ >\ /
        [first, middle..., secondToLast, last] = name.split " > "
        first = switch first
          when "needs" then "🌳"
          when "negEmotions" then "☹️"
          when "posEmotions" then "😀"
          else first
        name = "#{first} #{secondToLast} > #{last}"


      Button
        color:    StyleProps.leafColor
        text:     (@selected && selectedText) || text || name
        small:    true
        selected: @selected
        action:   @action
