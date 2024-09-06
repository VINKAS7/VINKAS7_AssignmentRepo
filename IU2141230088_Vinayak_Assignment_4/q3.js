const crypto = require('crypto');
const text = "Dev => Karan | Rs 100, Karan => Darsh | Rs 10 "
function findStringWithSHA256Prefix(prefix = '00000') {
    let i = 0;
    while (true) {
        const inputString = text + i.toString();
        const hash = crypto.createHash('sha256').update(inputString).digest('hex');
        if (hash.startsWith(prefix)) {
            console.log(`Input string: ${inputString}`);
            console.log(`SHA-256 hash: ${hash}`);
            return;
        }
        i++;
    }
}

findStringWithSHA256Prefix();