import Graphics.UI.GLUT
import Graphics.Rendering.OpenGL

-- Main function
main :: IO ()

xCoord :: GLfloat -> GLfloat -> [GLfloat]
yCoord :: GLfloat -> GLfloat -> [GLfloat]
zCoord :: GLfloat -> GLfloat -> [GLfloat]
pointGen :: GLfloat -> GLfloat -> [(GLfloat, GLfloat, GLfloat)]

xCoord x r = iterate (\y -> r * y *(1 - y)) x
yCoord i r = iterate (\y -> r * y *(1 - y)) i
zCoord z r = iterate (\y -> r * y *(1 - y)) z
    
pointGen x r = [(xCoordinate, yCoordinate, zCoordinate) | (xCoordinate, yCoordinate, zCoordinate) <- zip3 (xCoord x r) (yCoord x r) (zCoord x r)]

main = do
    _ <- getArgsAndInitialize        -- Initialize GLUT
    _ <- createWindow "Chaos Equation Visualiser"     -- Create the window
    _ <- fullScreenToggle
    displayCallback $= display        -- Set display callback
    mainLoop                         -- Start the main loop

-- Function to display the scene
display :: DisplayCallback
display = do
    clear [ColorBuffer]               -- Clear the color buffer

    flush
