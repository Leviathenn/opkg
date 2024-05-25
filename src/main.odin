/**
    * @author Leviathenn
**/

package opkg;
import "core:encoding/json/s"
import "core:os"
import "core:fmt"
import "examples/tp"
usage :: proc (argCount: int) {
  fmt.printfln("opkg <install | remove > | source <add | delete> <package | source>\n Expected 2 arguments, but got %d",argCount);
}



main :: proc() {
    arguments := os.args[1:]
    if len(arguments) < 2 {
	usage(len(arguments))
    }else {
        fmt.printfln("Args len: %d",len(arguments))
    }
    
}
