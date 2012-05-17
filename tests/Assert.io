#! /usr/local/bin/io

# Assert module
Assert := Object clone

# AssertionError (Exception)
Assert AssertionError := Exception clone


# Assert assert(expr[, message])
#
# raise an AssertionError if `expr` if false.
# if a message is provided, it is used as Exception message
Assert assert := method(expr, msg,
    
    if(expr,
        return,
        a := Assert AssertionError clone;
        if (msg, 
            a raise(msg),
            a raise()
        )
    )
)

# Assert assertEquals(expected, value[, message])
#
# raise an AssertionError if `value` is not equal to `expected`.
# if a message is provided, it is used as Exception message
Assert assertEquals := method(expected, value, msg,
    
    if(expected == value,
        return,
        a := Assert AssertionError clone;
        if (msg, 
            a raise(msg),
            a raise()
        )
    )
)


# Assert assertNotEquals(expected, value[, message])
#
# raise an AssertionError if `value` is equal to `expected`.
# if a message is provided, it is used as Exception message
Assert assertNotEquals := method(expected, value, msg,
    
    if((expected == value) not,
        return,
        a := Assert AssertionError clone;
        if (msg, 
            a raise(msg),
            a raise()
        )
    )
)
