Basic question is this: why should we have to jump through weird hoops
of explicitly declaring some modules as trusted to reach into our internals?
I'd much rather simply hide the internals of my restricted monad entirely.

The trick then is to allow the calling function (which is by definition a trusted
component) to provide callbacks to be used by the Safe modules.

Notice how BadMain will not compile, but GoodMain will.