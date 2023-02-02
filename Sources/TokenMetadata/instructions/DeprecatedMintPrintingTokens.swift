/**
 * This code was GENERATED using the solita package.
 * Please DO NOT EDIT THIS FILE, instead rerun solita to update it or write a wrapper to add functionality.
 *
 * See: https://github.com/metaplex-foundation/solita-swift
 */
import Foundation
import Beet
import Solana

/**
 * @category Instructions
 * @category DeprecatedMintPrintingTokens
 * @category generated
 */
public struct DeprecatedMintPrintingTokensInstructionArgs{
    let instructionDiscriminator: [UInt8] /* size: 8 */
    let mintPrintingTokensViaTokenArgs: MintPrintingTokensViaTokenArgs

    public init(
        instructionDiscriminator: [UInt8] /* size: 8 */ = deprecatedMintPrintingTokensInstructionDiscriminator,
        mintPrintingTokensViaTokenArgs: MintPrintingTokensViaTokenArgs
    ) {
        self.instructionDiscriminator = instructionDiscriminator
        self.mintPrintingTokensViaTokenArgs = mintPrintingTokensViaTokenArgs
    }
}
/**
 * @category Instructions
 * @category DeprecatedMintPrintingTokens
 * @category generated
 */
public let DeprecatedMintPrintingTokensStruct = FixableBeetArgsStruct<DeprecatedMintPrintingTokensInstructionArgs>(
    fields: [
        ("instructionDiscriminator", Beet.fixedBeet(.init(value: .collection(UniformFixedSizeArray<UInt8>(element: .init(value: .scalar(u8())), len: 8))))),
        ("mintPrintingTokensViaTokenArgs", mintPrintingTokensViaTokenArgsBeetWrapped)
    ],
    description: "DeprecatedMintPrintingTokensInstructionArgs"
)
/**
* Accounts required by the _DeprecatedMintPrintingTokens_ instruction
*
* @property [_writable_] destination  
* @property [_writable_] printingMint  
* @property [**signer**] updateAuthority  
* @property [] metadata  
* @property [] masterEdition   
* @category Instructions
* @category DeprecatedMintPrintingTokens
* @category generated
*/
public struct DeprecatedMintPrintingTokensInstructionAccounts {
    let destination: PublicKey
    let printingMint: PublicKey
    let updateAuthority: PublicKey
    let metadata: PublicKey
    let masterEdition: PublicKey
    let tokenProgram: PublicKey?
    let rent: PublicKey?

    public init(
        destination: PublicKey,
        printingMint: PublicKey,
        updateAuthority: PublicKey,
        metadata: PublicKey,
        masterEdition: PublicKey,
        tokenProgram: PublicKey? = nil,
        rent: PublicKey? = nil
    ) {
        self.destination = destination
        self.printingMint = printingMint
        self.updateAuthority = updateAuthority
        self.metadata = metadata
        self.masterEdition = masterEdition
        self.tokenProgram = tokenProgram
        self.rent = rent
    }
}

public let deprecatedMintPrintingTokensInstructionDiscriminator = [194, 107, 144, 9, 126, 143, 53, 121] as [UInt8]

/**
* Creates a _DeprecatedMintPrintingTokens_ instruction.
*
* @param accounts that will be accessed while the instruction is processed
  * @param args to provide as instruction data to the program
 * 
* @category Instructions
* @category DeprecatedMintPrintingTokens
* @category generated
*/
public func createDeprecatedMintPrintingTokensInstruction(accounts: DeprecatedMintPrintingTokensInstructionAccounts, 
args: DeprecatedMintPrintingTokensInstructionArgs, programId: PublicKey=PublicKey(string: "metaqbxxUerdq28cj1RbAWkYQm3ybzjb6a8bt518x1s")!) -> TransactionInstruction {

    let data = DeprecatedMintPrintingTokensStruct.serialize(
            instance: ["instructionDiscriminator": deprecatedMintPrintingTokensInstructionDiscriminator,
"mintPrintingTokensViaTokenArgs": args.mintPrintingTokensViaTokenArgs])

    let keys: [AccountMeta] = [
        AccountMeta(
            publicKey: accounts.destination,
            isSigner: false,
            isWritable: true
        ),
        AccountMeta(
            publicKey: accounts.printingMint,
            isSigner: false,
            isWritable: true
        ),
        AccountMeta(
            publicKey: accounts.updateAuthority,
            isSigner: true,
            isWritable: false
        ),
        AccountMeta(
            publicKey: accounts.metadata,
            isSigner: false,
            isWritable: false
        ),
        AccountMeta(
            publicKey: accounts.masterEdition,
            isSigner: false,
            isWritable: false
        ),
        AccountMeta(
            publicKey: accounts.tokenProgram ?? PublicKey.tokenProgramId,
            isSigner: false,
            isWritable: false
        ),
        AccountMeta(
            publicKey: accounts.rent ?? PublicKey.sysvarRent,
            isSigner: false,
            isWritable: false
        )
    ]

    let ix = TransactionInstruction(
                keys: keys,
                programId: programId,
                data: data.0.bytes
            )
    return ix
}