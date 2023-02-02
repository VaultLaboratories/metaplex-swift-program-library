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
 * @category CreateMetadataAccountV2
 * @category generated
 */
public struct CreateMetadataAccountV2InstructionArgs{
    let instructionDiscriminator: [UInt8] /* size: 8 */
    let createMetadataAccountArgsV2: CreateMetadataAccountArgsV2

    public init(
        instructionDiscriminator: [UInt8] /* size: 8 */ = createMetadataAccountV2InstructionDiscriminator,
        createMetadataAccountArgsV2: CreateMetadataAccountArgsV2
    ) {
        self.instructionDiscriminator = instructionDiscriminator
        self.createMetadataAccountArgsV2 = createMetadataAccountArgsV2
    }
}
/**
 * @category Instructions
 * @category CreateMetadataAccountV2
 * @category generated
 */
public let CreateMetadataAccountV2Struct = FixableBeetArgsStruct<CreateMetadataAccountV2InstructionArgs>(
    fields: [
        ("instructionDiscriminator", Beet.fixedBeet(.init(value: .collection(UniformFixedSizeArray<UInt8>(element: .init(value: .scalar(u8())), len: 8))))),
        ("createMetadataAccountArgsV2", createMetadataAccountArgsV2BeetWrapped)
    ],
    description: "CreateMetadataAccountV2InstructionArgs"
)
/**
* Accounts required by the _CreateMetadataAccountV2_ instruction
*
* @property [_writable_] metadata  
* @property [] mint  
* @property [**signer**] mintAuthority  
* @property [_writable_, **signer**] payer  
* @property [] updateAuthority   
* @category Instructions
* @category CreateMetadataAccountV2
* @category generated
*/
public struct CreateMetadataAccountV2InstructionAccounts {
    let metadata: PublicKey
    let mint: PublicKey
    let mintAuthority: PublicKey
    let payer: PublicKey
    let updateAuthority: PublicKey
    let systemProgram: PublicKey?
    let rent: PublicKey?

    public init(
        metadata: PublicKey,
        mint: PublicKey,
        mintAuthority: PublicKey,
        payer: PublicKey,
        updateAuthority: PublicKey,
        systemProgram: PublicKey? = nil,
        rent: PublicKey? = nil
    ) {
        self.metadata = metadata
        self.mint = mint
        self.mintAuthority = mintAuthority
        self.payer = payer
        self.updateAuthority = updateAuthority
        self.systemProgram = systemProgram
        self.rent = rent
    }
}

public let createMetadataAccountV2InstructionDiscriminator = [24, 73, 41, 237, 44, 142, 194, 254] as [UInt8]

/**
* Creates a _CreateMetadataAccountV2_ instruction.
*
* @param accounts that will be accessed while the instruction is processed
  * @param args to provide as instruction data to the program
 * 
* @category Instructions
* @category CreateMetadataAccountV2
* @category generated
*/
public func createCreateMetadataAccountV2Instruction(accounts: CreateMetadataAccountV2InstructionAccounts, 
args: CreateMetadataAccountV2InstructionArgs, programId: PublicKey=PublicKey(string: "metaqbxxUerdq28cj1RbAWkYQm3ybzjb6a8bt518x1s")!) -> TransactionInstruction {

    let data = CreateMetadataAccountV2Struct.serialize(
            instance: ["instructionDiscriminator": createMetadataAccountV2InstructionDiscriminator,
"createMetadataAccountArgsV2": args.createMetadataAccountArgsV2])

    var keys: [AccountMeta] = [
        AccountMeta(
            publicKey: accounts.metadata,
            isSigner: false,
            isWritable: true
        ),
        AccountMeta(
            publicKey: accounts.mint,
            isSigner: false,
            isWritable: false
        ),
        AccountMeta(
            publicKey: accounts.mintAuthority,
            isSigner: true,
            isWritable: false
        ),
        AccountMeta(
            publicKey: accounts.payer,
            isSigner: true,
            isWritable: true
        ),
        AccountMeta(
            publicKey: accounts.updateAuthority,
            isSigner: false,
            isWritable: false
        ),
        AccountMeta(
            publicKey: accounts.systemProgram ?? PublicKey.systemProgramId,
            isSigner: false,
            isWritable: false
        )
    ]
    if accounts.rent != nil {
        
        keys.append(
            AccountMeta(
                publicKey: accounts.rent!,
                isSigner: false,
                isWritable: false
            )
        )
    } 

    let ix = TransactionInstruction(
                keys: keys,
                programId: programId,
                data: data.0.bytes
            )
    return ix
}