

module Program =

    [<EntryPoint>]
    let main _ =
        let mutable port = 1900
        let mutable (cpu, io) = (0,0)
        let mutable ret = 0

        System.Threading.ThreadPool.GetMinThreads(&cpu, &io)
        printfn "[smp] [cpu:%i] [io:%i]" cpu io

        ret
