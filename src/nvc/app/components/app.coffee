Foundation = require 'art-foundation'
React = require 'art-react'
Namespace = require './namespace'

ShowMap = require './ShowMap'
{Nvc} = require '../data'

{log, inspect, defineModule} = Foundation

{
  CanvasElement
  RectangleElement
  PagingScrollElement
  TextElement
  Element
  Component
} = React

{textStyle} = Neptune.Nvc.App.Styles.StyleProps

defineModule module, class App extends Component
  module: module

  @stateFields
    canvasSize: null
    initialContentSize: null

  ready: ({target}) ->
    @canvasSize = target.currentSize

  initialContentReady: ({target}) ->
    @initialContentSize ||= target.currentSize

  render: ->
    {canvasSize, initialContentSize} = @state
    CanvasElement
      canvasId: "artCanvas"
      childrenLayout: "column"
      # on: ready: @ready
      RectangleElement inFlow: false, color: "#f9f9f9"

      TextElement
        inFlow: false
        size: ww:1, hch:1
        align: "center"
        fontFamily: "arial"
        color: "#0004"
        padding: 10
        text: "by Shane Brinkman-Davis Delamore"

      Element
        size: ps: 1
        padding: 5
        childrenLayout: "column"
        childrenAlignment: "bottomCenter"
        # on: ready: @initialContentReady
        # Element
        #   size: h: canvasSize?.y - initialContentSize?.y - 10|| 0
        #   RectangleElement color: "red"
        # Element
        #   size: ww:1, hch:1
        #   childrenLayout: "row"
        #   childrenAlignment: "center"

        #   TextElement textStyle,
        #     size: cs: 1
        #     padding: 10
        #     fontSize: 12

        #     text: """

        #       Needs list and App by
        #       Shane Brinkman-Davis Delamore
        #       v#{Neptune.Nvc.version}

        #       Emotion lists:
        #       NVC Content
        #       (c) 2005 by Center for Nonviolent Communication
        #       Website: www.cnvc.org Email: cnvc@cnvc.org
        #       Phone: +1.505-244-4041

        #       """

        ShowMap map: Nvc.core
