'point.in.hr' <- 

function (x, y = NULL, hr.mcp) 
{
    pol <- get.pts(hr.mcp$mcp)
    if (is.null(y)) {
        y <- x[, 2]
        x <- x[, 1]
    }
    point.in.polygon(point.x = x, point.y = y, pol.x = pol[[1]]$x, 
        pol.y = pol[[1]]$y)
}