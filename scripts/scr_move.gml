// movement pada line 1
if (hLine == 1)
{

        hPos ++;            
                   
        if (player == hLine)
        {
            // hole position
            if (hPos > holes+1)
            {
                hLine = 2;   
                hPos = holes;
            }
            
        }
        else
        {
            // hole position
            if (hPos > holes)
            {
                hLine = 2;
                hPos = holes;
            }
        }            
    
}
// movement pada line 2
else
{

        hPos --;

                   
        if (player == hLine)
        {
            // hole position
            if (hPos < 0)
            {
                hLine = 1;   
                hPos = 1;
            }
        }
        else
        {
            // hole position
            if (hPos == 0)
            {
                hLine = 1;
                hPos = 1;
            }
        }
    
}
