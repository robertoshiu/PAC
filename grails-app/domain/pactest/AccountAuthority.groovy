package pactest

import org.apache.commons.lang.builder.HashCodeBuilder

class AccountAuthority implements Serializable {

	Account account
	Authority authority

	boolean equals(other) {
		if (!(other instanceof AccountAuthority)) {
			return false
		}

		other.account?.id == account?.id &&
			other.authority?.id == authority?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (account) builder.append(account.id)
		if (authority) builder.append(authority.id)
		builder.toHashCode()
	}

	static AccountAuthority get(long accountId, long authorityId) {
		find 'from AccountAuthority where account.id=:accountId and authority.id=:authorityId',
			[accountId: accountId, authorityId: authorityId]
	}

	static AccountAuthority create(Account account, Authority authority, boolean flush = false) {
		new AccountAuthority(account: account, authority: authority).save(flush: flush, insert: true)
	}

	static boolean remove(Account account, Authority authority, boolean flush = false) {
		AccountAuthority instance = AccountAuthority.findByAccountAndAuthority(account, authority)
		if (!instance) {
			return false
		}

		instance.delete(flush: flush)
		true
	}

	static void removeAll(Account account) {
		executeUpdate 'DELETE FROM AccountAuthority WHERE account=:account', [account: account]
	}

	static void removeAll(Authority authority) {
		executeUpdate 'DELETE FROM AccountAuthority WHERE authority=:authority', [authority: authority]
	}

	static mapping = {
		id composite: ['authority', 'account']
		version false
	}
}
