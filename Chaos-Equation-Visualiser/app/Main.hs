import Graphics.UI.GLUT
import Graphics.Rendering.OpenGL

-- Main function
main :: IO ()

x1, x2, y1, y2 :: GLfloat
x1 = 0
x2 = 0
y1 = 0.4
y2 = 0.4

main = do
    _ <- getArgsAndInitialize        -- Initialize GLUT
    _ <- createWindow "Simple OpenGL"     -- Create the window
    displayCallback $= display        -- Set display callback
    mainLoop                         -- Start the main loop

-- Function to display the scene
display :: DisplayCallback
display = do
    clear [ColorBuffer]               -- Clear the color buffer
    renderPrimitive Lines $ do
        vertex $ vertex2 x1 y1
        vertex $ vertex2 x2 y2    
    flush