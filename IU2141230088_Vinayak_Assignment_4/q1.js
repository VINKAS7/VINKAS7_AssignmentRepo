const crypto = require('crypto');

function findStringWithSHA256Prefix(prefix = '00000') {
    let i = 0;
    while (true) {
        const inputString = i.toString();
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