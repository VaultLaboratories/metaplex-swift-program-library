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
 * @category UpdateMetadataAccountV2
 * @category generated
 */
public struct UpdateMetadataAccountV2InstructionArgs{
    let instructionDiscriminator: [UInt8] /* size: 8 */
    let updateMetadataAccountArgsV2: UpdateMetadataAccountArgsV2

    public init(
        instructionDiscriminator: [UInt8] /* size: 8 */ = updateMetadataAccountV2InstructionDiscriminator,
        updateMetadataAccountArgsV2: UpdateMetadataAccountArgsV2
    ) {
        self.instructionDiscriminator = instructionDiscriminator
        self.updateMetadataAccountArgsV2 = updateMetadataAccountArgsV2
    }
}
/**
 * @category Instructions
 * @category UpdateMetadataAccountV2
 * @category generated
 */
public let UpdateMetadataAccountV2Struct = FixableBeetArgsStruct<UpdateMetadataAccountV2InstructionArgs>(
    fields: [
        ("instructionDiscriminator", Beet.fixedBeet(.init(value: .collection(UniformFixedSizeArray<UInt8>(element: .init(value: .scalar(u8())), len: 8))))),
        ("updateMetadataAccountArgsV2", updateMetadataAccountArgsV2BeetWrapped)
    ],
    description: "UpdateMetadataAccountV2InstructionArgs"
)
/**
* Accounts required by the _UpdateMetadataAccountV2_ instruction
*
* @property [_writable_] metadata  
* @property [**signer**] updateAuthority   
* @category Instructions
* @category UpdateMetadataAccountV2
* @category generated
*/
public struct UpdateMetadataAccountV2InstructionAccounts {
    let metadata: PublicKey
    let updateAuthority: PublicKey

    public init(
        metadata: PublicKey,
        updateAuthority: PublicKey
    ) {
        self.metadata = metadata
        self.updateAuthority = updateAuthority
    }
}

public let updateMetadataAccountV2InstructionDiscriminator = [202, 132, 152, 229, 216, 217, 137, 212] as [UInt8]

/**
* Creates a _UpdateMetadataAccountV2_ instruction.
*
* @param accounts that will be accessed while the instruction is processed
  * @param args to provide as instruction data to the program
 * 
* @category Instructions
* @category UpdateMetadataAccountV2
* @category generated
*/
public func createUpdateMetadataAccountV2Instruction(accounts: UpdateMetadataAccountV2InstructionAccounts, 
args: UpdateMetadataAccountV2InstructionArgs, programId: PublicKey=PublicKey(string: "metaqbxxUerdq28cj1RbAWkYQm3ybzjb6a8bt518x1s")!) -> TransactionInstruction {

    let data = UpdateMetadataAccountV2Struct.serialize(
            instance: ["instructionDiscriminator": updateMetadataAccountV2InstructionDiscriminator,
"updateMetadataAccountArgsV2": args.updateMetadataAccountArgsV2])

    let keys: [AccountMeta] = [
        AccountMeta(
            publicKey: accounts.metadata,
            isSigner: false,
            isWritable: true
        ),
        AccountMeta(
            publicKey: accounts.updateAuthority,
            isSigner: true,
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