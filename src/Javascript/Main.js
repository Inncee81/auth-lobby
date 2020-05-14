/*

| (• ◡•)| (❍ᴥ❍ʋ)

*/

const PEER_WSS = "/dns4/node.fission.systems/tcp/4003/wss/ipfs/QmVLEz2SxoNiFnuyLpbXsH6SvjPTrHNMU88vCQZyhgBzgw"
const PEER_TCP = "/ip4/3.215.160.238/tcp/4001/ipfs/QmVLEz2SxoNiFnuyLpbXsH6SvjPTrHNMU88vCQZyhgBzgw"

let ipfs
let ks


// 🚀


bootElm()


// getIpfs.default().then(i => {
//   ipfs = i
//   return keystore.init({ type: "rsa" })
//
// }).then(k => {
//   ks = k
//
//   bootElm()
//   bootIpfs()
//
// })



// ELM


async function bootElm() {
  const hasLocalKeyPair = await keystore.idb.exists(keystore.DEFAULT_READ_KEY_NAME)

  Elm.Main.init({
    flags: { hasLocalKeyPair }
  })
}



// IPFS

function bootIpfs() {
  console.log(ipfs)
}
