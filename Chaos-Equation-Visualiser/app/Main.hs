import Graphics.UI.GLUT
import Graphics.Rendering.OpenGL

-- Main function
main :: IO ()

xCoord :: GLfloat -> GLfloat -> [GLfloat]
yCoord :: GLfloat -> GLfloat -> [GLfloat]
zCoord :: GLfloat -> GLfloat -> [GLfloat]
pointGen :: GLfloat -> GLfloat -> [(GLfloat, GLfloat, GLfloat)]

xCoord x r = take 30 (iterate (\y -> r * y *(1 - y)) x)
yCoord i r = take 30 (iterate (\y -> r * y *(1 - 0.6 * y)) i)
zCoord z r = take 30 (iterate (\y -> r * y *(1 - 0.2 * y)) z)
    
pointGen x r = [(xCoordinate, yCoordinate, zCoordinate) | (xCoordinate, yCoordinate, zCoordinate) <- zip3 (xCoord x r) (yCoord x r) (zCoord x r)]

main = do
    _ <- getArgsAndInitialize        -- Initialize GLUT
    _ <- createWindow "Chaos Equation Visualiser"     -- Create the window
    --_ <- fullScreenToggle
    displayCallback $= display        -- Set display callback
    mainLoop                         -- Start the main loop

-- Function to display the scene
display :: DisplayCallback
display = do
    clear [ColorBuffer]               -- Clear the color buffer

    renderPrimitive Points $
        mapM_ (\(x, y, z) -> vertex $ Vertex3 x y z) (pointGen 0.4 4)
    flush
