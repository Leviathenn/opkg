/**
    * @author Leviathenn
**/

package opkg;
import "core:encoding/json"
import "core:os"
import "core:fmt"
import "core:odin/parser"
import "core:sys/windows"
import "core:time"
import "core:mem"
messageBox :: proc(message: string) {

    wide_str := stringToWideString(message)
    wideMessage := &wide_str[0]

    lpcwstr := windows.LPCWSTR(wideMessage)

    _ = windows.MessageBoxW(nil, lpcwstr, lpcwstr, windows.MB_OK)
}
exec :: proc(message: string) {

}

 stringToWideString:: proc(odin_str: string) -> []u16 {

    wide_str := make([]u16, len(odin_str)+1)

    for i := 0; i < len(odin_str); i += 1 {
        wide_str[i] = u16(odin_str[i])
    }
    wide_str[len(odin_str)] = 0

    return wide_str;
}
usage :: proc (argCount: int) {
  fmt.printfln("opkg <install | remove > | source <add | delete> <package | source>\n Expected 2 arguments, but got %d",argCount);
}



main :: proc() {
    arguments := os.args[1:]
    if len(arguments) < 2 {
    	usage(len(arguments))
        // Define the Odin string
        odin_str := "Hello, World!"

        // Allocate memory for the wide string (UTF-16)
        wide_str := make([]u16, len(odin_str)+1)

        // Convert the Odin string to a null-terminated UTF-16 string
        for i := 0; i < len(odin_str); i += 1 {
            wide_str[i] = u16(odin_str[i])
        }
        wide_str[len(odin_str)] = 0

        // Cast the slice to a pointer to u16
        wide_str_ptr := &wide_str[0]

        // Cast the u16 pointer to an LPCWSTR
        lpcwstr := windows.LPCWSTR(wide_str_ptr)

        // Use the LPCWSTR in a Windows API call (MessageBoxW)
        result := windows.MessageBoxW(nil, lpcwstr, lpcwstr, windows.MB_OK)

        // Print the result
        fmt.println("MessageBox result:", result)
         
    }else {
        fmt.printfln("Args len: %d",len(arguments))
        
    }
    
}
