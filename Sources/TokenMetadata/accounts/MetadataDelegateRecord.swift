/**
 * This code was GENERATED using the solita package.
 * Please DO NOT EDIT THIS FILE, instead rerun solita to update it or write a wrapper to add functionality.
 *
 * See: https://github.com/metaplex-foundation/solita-swift
 */
import Foundation
import BeetSolana
import Beet
import Solana


/**
* Arguments used to create {@link Metadatadelegaterecord}
* @category Accounts
* @category generated
*/
public protocol MetadatadelegaterecordArgs {
    
     var key: Key { get }
     var bump: UInt8 { get }
     var mint: PublicKey { get }
     var delegate: PublicKey { get }
     var updateAuthority: PublicKey { get }
}

/**
 * Holds the data for the {@link Metadatadelegaterecord} Account and provides de/serialization
 * functionality for that data
 *
 * @category Accounts
 * @category generated
 */
public struct Metadatadelegaterecord: MetadatadelegaterecordArgs {
  

  public let key: Key
  public let bump: UInt8
  public let mint: PublicKey
  public let delegate: PublicKey
  public let updateAuthority: PublicKey

  /**
   * Creates a {@link Metadatadelegaterecord} instance from the provided args.
   */
  public static func fromArgs(args: Args) -> Metadatadelegaterecord {
    return Metadatadelegaterecord(
        key: args["key"] as! Key,
        bump: args["bump"] as! UInt8,
        mint: args["mint"] as! PublicKey,
        delegate: args["delegate"] as! PublicKey,
        updateAuthority: args["updateAuthority"] as! PublicKey
    )
  }
  /**
   * Deserializes the {@link Metadatadelegaterecord} from the data of the provided {@link web3.AccountInfo}.
   * @returns a tuple of the account data and the offset up to which the buffer was read to obtain it.
   */
  public static func fromAccountInfo(
    accountInfo: Foundation.Data,
    offset:Int=0
  ) -> ( Metadatadelegaterecord, Int )  {
    return Metadatadelegaterecord.deserialize(buf: accountInfo, offset: offset)
  }
  /**
   * Retrieves the account info from the provided address and deserializes
   * the {@link Metadatadelegaterecord} from its data.
   *
   * @throws Error if no account info is found at the address or if deserialization fails
   */
  public static func fromAccountAddress(
    connection: Api,
    address: PublicKey,
    onComplete: @escaping (Result<Metadatadelegaterecord, Error>) -> Void
  ) {
    connection.getAccountInfo(account: address.base58EncodedString) { result in
        switch result {
            case .success(let pureData):
                if let data = pureData.data?.value {
                    onComplete(.success(Metadatadelegaterecord.deserialize(buf: data).0))
                } else {
                    onComplete(.failure(SolanaError.nullValue))
                }
            case .failure(let error):
                onComplete(.failure(error))
        }
    }
  }
  /**
   * Deserializes the {@link Metadatadelegaterecord} from the provided data Buffer.
   * @returns a tuple of the account data and the offset up to which the buffer was read to obtain it.
   */
  public static func deserialize(
    buf: Foundation.Data,
    offset: Int = 0
  ) -> ( Metadatadelegaterecord, Int ) {
    return metadataDelegateRecordBeet.deserialize(buffer: buf, offset: offset)
  }
  /**
   * Serializes the {@link Metadatadelegaterecord} into a Buffer.
   * @returns a tuple of the created Buffer and the offset up to which the buffer was written to store it.
   */
  public func serialize() -> ( Foundation.Data, Int ) {
    return metadataDelegateRecordBeet.serialize(instance: Metadatadelegaterecord(key : self.key,
        bump : self.bump,
        mint : self.mint,
        delegate : self.delegate,
        updateAuthority : self.updateAuthority))
  }
    /**
  * Returns the byteSize of a {@link Buffer} holding the serialized data of
  * {@link Metadatadelegaterecord}
  */
  static func byteSize() -> UInt {
      return metadataDelegateRecordBeet.byteSize
  }
  /**
  * Fetches the minimum balance needed to exempt an account holding
  * {@link Metadatadelegaterecord} data from rent
  *
  * @param connection used to retrieve the rent exemption information
  */
  static func getMinimumBalanceForRentExemption(
      connection: Api,
      commitment: Commitment?,
      onComplete: @escaping(Result<UInt64, Error>) -> Void
  ) {
      return connection.getMinimumBalanceForRentExemption(dataLength: UInt64(Metadatadelegaterecord.byteSize()), commitment: commitment, onComplete: onComplete)
  }
  /**
  * Determines if the provided {@link Buffer} has the correct byte size to
  * hold {@link Metadatadelegaterecord} data.
  */
  static func hasCorrectByteSize(buf: Foundation.Data, offset:Int=0) -> Bool {
      return buf.bytes.count - offset == Metadatadelegaterecord.byteSize()
  }
}
  /**
   * @category Accounts
   * @category generated
   */
  public let metadataDelegateRecordBeet = BeetStruct(
    fields:[
        
        ("key", keyBeet),
        ("bump", (.init(value: .scalar(u8())))),
        ("mint", (.init(value: .scalar(BeetPublicKey())))),
        ("delegate", (.init(value: .scalar(BeetPublicKey())))),
        ("updateAuthority", (.init(value: .scalar(BeetPublicKey()))))
    ],
    construct: Metadatadelegaterecord.fromArgs,
    description: "Metadatadelegaterecord"
)