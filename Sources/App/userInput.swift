class InteractionLayer : Layer {

    init () {
        super.init(name: InteractionLayer)
    }
    // insert.Cursor
    
}

class Cursor : RenderableEntity, EntityMouseClickHandler {
    override func setup(canvasSize:Size, canvas:Canvas) {
    dispatcher.registerEntityMouseClickHandler(handler:self)
    }

    override func teardown() {
        dispatcher.unregisterEntityMouseClickHandler(handler:self)
    }

}

func onEntityMouseClick(globalLocation: Point) {
    ellipse.center = globalLocation
}

