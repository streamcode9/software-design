open System.Net.Sockets
open System.Collections.Specialized

module Program =

    type Msg =
        | Bin of byte array
        | Text of string
        | Nope

    type Sup =
        | Connect of MailboxProcessor<Msg> * NetworkStream
        | Disconnect of MailboxProcessor<Msg>
        | Close of NetworkStream
        | Tick

    type Req =
        { path    : string;
          method  : string;
          version : string;
          headers : NameValueCollection }

    [<EntryPoint>]
    let main _ =
        let mutable port = 1900
        let mutable (cpu, io) = (0,0)
        let mutable ret = 0

        System.Threading.ThreadPool.GetMinThreads(&cpu, &io)
        printfn "[smp] [cpu:%i] [io:%i]" cpu io

        ret
