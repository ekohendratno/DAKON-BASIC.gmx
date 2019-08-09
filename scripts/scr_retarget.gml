if (global.autoMove == false)
{
if (tPos > 0 && tPos <= holes)
{
        // movement pada line 1
        if (player == 1)
        {                
            if (player == tLine)
            {
                tPos++                                                             
            }
            else
            {
                if (tPos == 1)
                {
                    tLine = 1;
                }
                else
                {
                    tPos--
                }                
            }            
        }    
        if (player == 2)
        {                
            if (player == tLine)
            {
                tPos--                                                             
            }
            else
            {
                if (hPos == holes)
                {
                    tLine = 2;
                }
                else
                {
                    tPos++
                }                
            }            
        } 
}
else
{
    if (player == 1)
    {
        tLine = 2
        tPos--;
    }
    else
    {
        tLine = 1
        tPos++;       
    }
}
}
else
{
    tPos = hPos
    tLine = hLine
}

